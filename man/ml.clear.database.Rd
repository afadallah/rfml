% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/config.R
\name{ml.clear.database}
\alias{ml.clear.database}
\title{Remove all rfml internal files in a MarkLogic database.}
\usage{
ml.clear.database(host = "localhost", port = "8000", adminuser = "admin",
  password = "admin")
}
\arguments{
\item{host}{The hostname or ipadress of the MarkLogic REST instance. Default to localhost.}

\item{port}{The port number of the MarkLogic REST instance. 8000 is used default}

\item{adminuser}{The username of a user that have rights to install options. admin is default.}

\item{password}{The password admin is default.}
}
\value{
Nothing if success otherwise it will raise an error.
}
\description{
The function removes the \href{http://docs.marklogic.com/guide/rest-dev/extensions}{REST extensions} and
modules added with the \link{ml.init.database} function. It also removes the document, /rfml/rfmlInfo.json,
that stores the version of the rfml package and the date the database are initiated.
}
\details{
The user that is used for the login must have the  rest-admin role, or the following privileges:
\itemize{
 \item http://marklogic.com/xdmp/privileges/rest-admin
 \item http://marklogic.com/xdmp/privileges/rest-writer
 \item http://marklogic.com/xdmp/privileges/rest-reader
 }
}
\examples{
\dontrun{
ml.clear.database("localhost", "8000", "admin", "admin")
}
}

