function lmData(fields, result) {
  var json = require("/MarkLogic/json/json.xqy");
  var rfmlUtilities = require('/ext/rfml/rfmlUtilities.sjs');
  var flatResult = [];
  var results = result.results;

  for (var i = 0; i < results.length; i++) {
    if (results[i].format == 'xml') {
      /* This has not been tested fully */

      var xmlContent = xdmp.unquote(results[i].content);
      var config = json.config("custom");
      var resultContent = json.transformToJson(xmlContent, config).toObject();
    } else {
      var resultContent = results[i].content;
    };
    var flatDoc = {};
    // add additional fields
    flatDoc.docUri = results[i].uri;
    flatDoc.score = results[i].score;
    flatDoc.confidence = results[i].confidence;
    flatDoc.fitness = results[i].fitness;

    flatDoc = rfmlUtilities.flattenJsonObject(resultContent, flatDoc, "", false);
    var useFields = []
    for (var field in fields) {

      var fieldName = field;
      var fieldDef = fields[field].fieldDef;
      if (fieldDef !== fieldName) {
        flatDoc[fieldName] = eval(fieldDef.replace(/rfmlResult/g, "flatDoc"));
      }
      useFields.push(flatDoc[fieldName])
    };

    flatResult.push(useFields);
  };

  return flatResult;

}

function rfmlLm(context, params, content)
{
    var json = require("/MarkLogic/json/json.xqy");
  //var userName = xdmp.getRequestUsername();
  var result = content.toObject();
  //var dframe = params.dframe;

  var fields = {};
  if (!params.fields) {
    // we need at least two fields
  }
  fields = JSON.parse(params.fields);
  var lmArray = lmData(fields, result);
  // test with cts.linearModel first, if we get error try math that does not require range indexes
  // however since we flatten first this does not work...
  // to get cts.linearModel to work we need to convert search xml to cts.query XML, figure out if we
  // are using json or XML documents and to unflattern the field names...
  //try {
  //  var lm =  cts.linearModel(lmArray);
  //}
  //catch(err) {
    var lm =  math.linearModel(lmArray);
  //}

  var strLm = String(lm)
  var xmlLm = xdmp.unquote(strLm.substring(17, (strLm.length-1)))
  var config = json.config("custom");
  var jsonLm = json.transformToJson(xmlLm, config).toObject();

  return xdmp.toJsonString(jsonLm)

};

exports.transform = rfmlLm;