FROM openjdk:8
RUN wget https://mirrors.estointernet.in/apache/jmeter/binaries/apache-jmeter-5.4.tgz
RUN tar -xvzf apache-jmeter-5.4.tgz
RUN rm apache-jmeter-5.4.tgz
RUN mv apache-jmeter-5.4 /jmeter
ENV JMETER_HOME /jmeter
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
ARG GITREPO=https://github.com/Abhi-1982/docker-jmeter-sample
RUN git clone $GITREPO testplans 
RUN chmod +x /testplans/exec-jmeter.sh
RUN mkdir /testresults
RUN mkdir /testrunlog
# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
CMD ["/testplans/exec-jmeter.sh"]

