% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/config.R
\name{ml.init.database}
\alias{ml.init.database}
\title{Set up a MarkLogic database for use with rfml.}
\usage{
ml.init.database(host = "localhost", port = "8000", adminuser = "admin",
  password = "admin")
}
\arguments{
\item{host}{The hostname or ip-adress of the MarkLogic REST instance. Default to localhost.}

\item{port}{The port number of the MarkLogic REST instance. 8000 is used default}

\item{adminuser}{The username of a user that have rights to install options. admin is default.}

\item{password}{The password admin is default.}
}
\value{
Nothing if success or raise a error.
}
\description{
The function installs \href{http://docs.marklogic.com/guide/rest-dev/extensions}{REST extensions} and
modules needed to use the package againts a MarkLogic Server database. The function needs to be executed once
for each database that is going to be used with rfml. It also creates a document, /rfml/rfmlInfo.json, that
stores the version of the rfml package and the date the database are initiated.
}
\details{
The database must have a \href{http://docs.marklogic.com/guide/rest-dev/service#id_15309}{REST instance}
and a \href{http://docs.marklogic.com/guide/admin/databases#id_38484}{module database}. The REST instance needs
to be created according to \href{http://docs.marklogic.com/guide/rest-dev/service#id_12021}{Creating a REST instance}.
It also adds a document, /rfml/rfmlInfo.json, that stores the version of the rfml
package and the date the database are initiated.

The user that is used for the function need to have the rest-admin role,
or at least the following privileges:
\itemize{
 \item http://marklogic.com/xdmp/privileges/rest-admin
 \item http://marklogic.com/xdmp/privileges/rest-writer
 \item http://marklogic.com/xdmp/privileges/rest-reader
 }
}
\examples{
\dontrun{
ml.init.database("localhost", "8000", "admin", "admin")
}
}

