# ime_interproscan
Docker container for InterproScan

## Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

## Usage

The docker image provides the
[InterProScan](https://www.ebi.ac.uk/interpro/download.html) software. It will **not** run the
`/opt/interproscan/interproscan.sh` command as entrypoint.  Therefore, to run an analysis you need to run

```
docker run --rm -it greatfireball/ime_interproscan /opt/interproscan/interproscan.sh --version
```

Just provide all required parameters via command line.
Default working directory is `/data`.
Therefore, input data should be mounted using `/data` volume.

Example run:

```
docker run --rm -it -v $PWD:/data greatfireball/ime_interproscan.sh \
  -f TSV,XML,JSON,GFF3,HTML,SVG \
  --cpu 4 \
  --output-dir /data/output \
  --goterms \
  --iprlookup \
  --input infile.fasta \
  --pathways \
  --seqtype p \
  --appl CDD,Coils,PANTHER,Pfam,Phobius,PIRSF,PRINTS,ProDom,ProSitePatterns,ProSiteProfiles,SFLD,SMART,SUPERFAMILY,TIGRFAM
```

## Releases

The master branch contains a rolling release.  The develop branch is
used for further development.  Specific tags are used for different
releases. Latest release is
[![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:v5.34-73.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.34-73 "Get your own version badge on microbadger.com").

| Version/Branch | Commit in Docker Repo | Image |
| -------------- | --------------------- | ----- |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:master.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:master "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_interproscan:master.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:master "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_interproscan:master.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:master "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:develop.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:develop  "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_interproscan:develop.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:develop "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_interproscan:develop.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:develop "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:v5.34-73.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.34-73  "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_interproscan:v5.34-73.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.34-73 "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_interproscan:v5.34-73.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.34-73 "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:v5.33-72.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.33-72  "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_interproscan:v5.33-72.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.33-72 "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_interproscan:v5.33-72.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.33-72 "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:v5.32-71.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.32-71  "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_interproscan:v5.32-71.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.32-71 "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_interproscan:v5.32-71.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.32-71 "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_interproscan:v5.27-66.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.27-66  "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_interproscan:v5.27-66.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.27-66 "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_interproscan:v5.27-66.svg)](https://microbadger.com/images/greatfireball/ime_interproscan:v5.27-66 "Get your own image badge on microbadger.com") |


## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code
of conduct, and the process for submitting pull requests to us.

## Author

- **Frank Förster** - *Initial work* - [greatfireball](https://github.com/greatfireball)

See also the list of
[contributors](https://github.com/greatfireball/ime_interproscan/contributors)
who participated in this project.

## License

This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details.
