FROM rocker/r-ver:4.0.0

WORKDIR /fibo
RUN Rscript -e "install.packages('renv')"
COPY renv.lock .
RUN Rscript -e "renv::init()"
RUN Rscript -e "renv::restore(repos = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest')"
COPY . .
RUN Rscript -e "install.packages('.', repos = NULL, type='source')"
RUN chmod +x R/cli.R

EXPOSE 8000
CMD ["./R/cli.R", "--bind", "0.0.0.0"]
