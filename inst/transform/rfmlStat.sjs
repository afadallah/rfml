

function rfmlStat(context, params, content)
{
  var rfmlUtilities = require('/ext/rfml/rfmlUtilities.sjs');
  var result = content.toObject();
  var statFunc = params.statfunc;

  if (!statFunc) {
    /* we need a function... */
  };


  var fields = {};
  if (!params.fields) {
    /* we need at least 
    a fields */
  }
  fields = JSON.parse(params.fields);
  var funcArray = rfmlUtilities.fields2array(fields, result);
  var result =  eval(statFunc + '(funcArray)');

  return xdmp.toJsonString(result);

};
exports.transform = rfmlStat;