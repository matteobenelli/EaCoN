\name{EaCoN.BedGC.fasta}
\alias{EaCoN.BedGC.fasta}
\title{Compute GC-content of genomic regions defined by a BED file using a single genomic FASTA file.}
\usage{
EaCoN.BedGC.fasta(binned.bed.file = NULL, genome = "hg19", fasta = NULL, na.to0 = TRUE,
nt.add = c(0,50,100, 250, 500, 1000, 2500, 5000), out.dir = getwd(),
return.data = FALSE, nthread = 1)
}
\arguments{
\item{binned.bed.file}{BED file with binned region (ie, neither the WES capture BED, nor its cleaned version. See \code{Details}).}
\item{genome}{Genome build (one supported by datasets in the \code{chromosomes} package).}
\item{fasta}{FASTA file corresponding the nucleotidic sequence of the given \code{Details} (see \code{Details}).}
\item{na.to0}{Replace putative NA values of the computed GC-content by zero.}
\item{nt.add}{A numeric vector corresponding to Window(s) of extension of the BED regions (see \code{Details}).}
\item{out.dir}{Output directory.}
\item{return.data}{Return the computed GC-content as a data.frame (and still write it as a BED-like file).}
\item{nthread}{Number of threads for multithreading (see \code{Details}).}
}
\description{
This computes the GC-content of a BED file, and possibly extensions of these regions.
}
\value{
A new BED-like file (with a ".gc" extension) containing the computed GC-content, and returned as a \code{data.frame} if \code{return.data} is set to \code{TRUE}.
}
\details{
\itemize{
\item{\code{binned.bed.file} : This BED file corresponds to the BED generated by \code{A2p::A2p.BAMConv()}, thus corresponding to binning of the capture BED after being processed through \code{A2p::A2p.BedCheck()}.}
\item{\code{fasta} : Single FASTA file containing the genomic sequence corresponding to the given \code{genome}. This has to be a samtools-indexed FASTA file.}
\item{\code{nt.add} : To simulate different states of degradation of DNA, GC-content can be computed on several tracks corresponding to different sizes of extension of the regions defined by te \code{binned.bed.file}. The \code{nt.add} parameter corresponds to a numeric vector containing the different extension size(s) desired. Please note that these sizes are expressed in nucleotides unit, and that the extension will be performed on both sides of the regions. Example : with an extension size of 50, the genomic region chr1:1000-1100 will get extended to chr1:950-1150. Default value for this parameter is recommended for WES data.}
\item{\code{nthread} : When \code{nthread} > 1, multithreading is performed using one track (one extension) per thread, so please do not use a value greater than the length of \code{nt.add}. Please also note that this function can consume large amounts of RAM (example : 3 GB per thread is require for human hg19, to add to the current session used RAM !)}
}
}
\author{
Bastien Job
}

