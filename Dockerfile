FROM rocker/r-ver:4.0.0

WORKDIR /fibo
RUN Rscript -e "install.packages('renv')"
COPY renv.lock .
RUN Rscript -e "renv::init()"
RUN Rscript -e "renv::restore()"
COPY . .
RUN Rscript -e "install.packages('.', repos = NULL, type='source')"
RUN chmod +x cli.R

CMD ["./cli.R"]
