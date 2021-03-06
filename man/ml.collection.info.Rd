% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ml.collection.R
\name{ml.collection.info}
\alias{ml.collection.info}
\title{Retrives information about a collection}
\usage{
ml.collection.info(conn, collection)
}
\arguments{
\item{conn}{A \link{ml.conn-class} object created by \link{ml.connect}}

\item{collection}{A string woth the name of the collection}
}
\description{
The function extracts the structure of the documents belonging to a collection
based on a sample it also estimates the number of documents that belongs to the collection.
}
\examples{
\dontrun{
 library(rfml)
 localConn <- ml.connect()
 ml.collection.info(localConn, "iris")
 }
}

