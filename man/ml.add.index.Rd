% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/config.R
\name{ml.add.index}
\alias{ml.add.index}
\title{Creates or updates a Range element index.}
\usage{
ml.add.index(x, scalarType = "string",
  collation = "http://marklogic.com/collation/", namespaceUri = "",
  database = "Documents", host = "", port = "8002", adminuser = "",
  password = "", conn = NA)
}
\arguments{
\item{x}{a ml.data.frame field that the index will be created on}

\item{scalarType}{An atomic type specification. "string" is default}

\item{collation}{For scalarType = string, you can use a different collation than the default. Default is "http://marklogic.com/collation/"}

\item{namespaceUri}{The namespace URI of the XML element, if JSON ignore. Default is empty.}

\item{database}{The name of the database to create the index in. "Documents" is default.}

\item{host}{The hostname or ipadress of the MarkLogic Manage server. Default is the same as used for conn}

\item{port}{The port number of the MarkLogic Manage server. 8002 is used default}

\item{adminuser}{The username of a user that have rights to create index. Default is the same as used for conn}

\item{password}{The password. Default is the same as used for conn.}

\item{conn}{A \link{ml.conn-class} with a connection to a MarkLoic server. Optional.}
}
\value{
The function will raise a error if something goes wrong.
}
\description{
The function creates or updates a \href{http://docs.marklogic.com/guide/concepts/indexing#id_51573}{range element index}
on the underlying element/property of a \link{ml.data.frame} field.
The user that is used for the login needs the manage-admin role, or the following privilege:
\itemize{
 \item http://marklogic.com/xdmp/privileges/manage-admin
 }
}
\details{
The function only creates and updates range index on a XML element or JSON property based on the \link{ml.data.frame} field.
Information about the field can be shown by \code{mlDataFrame$itemField}, where mlDataFrame is a \link{ml.data.frame} object
and itemField is the name of the field. Indexes created with this function will always have range-value-positions equal true.
}

