# Copyright (c) 2015 All rights reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

# Various statistics methods

#' Correlation
#'
#' Returns the Pearson correlation coefficient of a data set. The size of the input
#' should be 2.
#'
#' The function eliminates all pairs for which either the first element or the second
#' element is empty. After the elimination, if the length of the input is less than 2,
#' the function returns the empty sequence. After the elimination, if the standard
#' deviation of the first column or the standard deviation of the second column is 0,
#' the function returns the empty sequence.
#'
#' @export
setMethod(f="cor", signature=c(x="ml.col.def",y="ml.col.def"),

          function(x,y,use = NULL,method = NULL ) {

            # use
            if (!missing(use) && !is.null(use))
             stop(simpleError("use option is not implemented yet"))

             # method
            if (!missing(method) && !is.null(method))
               stop(simpleError("method option is not implemented yet"))

            if(x@.parent@.name!=y@.parent@.name) {
               stop("Cannot combine two columns from different ml.data.frames.")
            }
            if(x@.data_type!="number" || y@.data_type != "number") {
              stop("Can only use columns of number type")
            }

            key <- .rfmlEnv$key
            password <- rawToChar(PKI::PKI.decrypt(.rfmlEnv$conn$password, key))
            username <- .rfmlEnv$conn$username
            queryComArgs <- x@.queryArgs

            mlHost <- paste("http://", .rfmlEnv$conn$host, ":", .rfmlEnv$conn$port, sep="")
            mlSearchURL <- paste(mlHost, "/LATEST/search", sep="")
            nPageLength <- x@.nrows
            queryArgs <- c(queryComArgs, pageLength=nPageLength, transform="rfmlStat")

            fields <- "{"
            # check if dependent or independent is existing fields
            # or new, if new we ned to use the expersion
#            if (is.null(x@.col.defs[[dependent]])) {
#              fieldDefDep <- dependent
#            } else {
#              fieldDefDep <- y@.col.defs[[dependent]]
#            }
#            if (is.null(y@.col.defs[[independent]])) {
#              fieldDefInd <- independent
#            } else {
#              fieldDefInd <- y@.col.defs[[independent]]
#            }

            #fields <- paste(fields, '"',dependent , '":{"fieldDef":"',fieldDefDep ,'"},"', independent, '":{"fieldDef":"',fieldDefInd ,'"}' ,sep='')
            #fields <- paste(fields, '}', sep='')
            #message(fields)
            queryArgs <- c(queryArgs, 'trans:fields'=fields)
        }
)

