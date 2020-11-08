# Db2-DDF-Analysis-Tool

Db2 DDF Analysis Tool is a set of DFSORT programs to report on Db2 Accounting Trace (SMF 101), specifically for DDF applications.

(When we say "DFSORT", the code has not been tested on any other sort product - but few if any problems are expected. Reports of compatibility would be gratefully received)

## Repository Contents

This initial release consists of the following programs:

1. ASMEXIT to assemble an E15 exit that reformats the SMF 101 records. (The $ASM procedure is included for this purpose.)
1. BUILDDB to read SMF 101 data and, using the exit and DFSORT to write a number of flat files. These files are what reporting code (generally DFSORT or ICETOOL but could be eg REXX) can run against.

The intention is to add reporting samples, and for users to generate their own. If they'd like to contribute them to this **open source** project that would be great.)

## Installation

To install the code:

1. Download from here.
1. Send the JCL members to a JCL PDS(E) on the z/OS LPAR you intend to run the code on.
1. Send the CTL member to another FB80 PDS(E) of your choosing.
1. Edit and submit the ASMEXIT job, assembling and link editing into a load library of your choosing.
1. Extract a small set of SMF 101 data and point at it (via SORTIN) in an edited version of the BUILDDB job.

All the jobs should return RC=0. The test with the small set of SMF 101 data should suffice for Installation Verification.

"Editing" means finding the variables, denoted by `<...>` and changing them to values that work for you.

Note the line

    DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM) 

This member is the DFSORT Symbols deck that the build job and reporting jobs will use to map the flat files created by BUILDDB.

## Use

Once you've established the BUILDDB job works you can modify it so the SORTIN points to an appropriate source. Likewise you can modify the OUTFIL data sets to point to appropriate targets.
Reporting jobs, obviously need to point to the right "database" input data sets.

Note again the need to use the edited name for `DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)` to map the database data sets.

**Pro Tip:** You can concatenate your own symbols deck after this symbols file.
Generally I use inline symbols, but you can "harden" them in a file of your own.
