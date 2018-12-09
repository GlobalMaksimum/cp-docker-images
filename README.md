Docker Images for Confluent Plaform with Kerberos and monitoring
===

Building a kerberos enabled kafka cluster with prometheus monitoring.

Open a terminal and enter to the project root directory. 

execute commands below
```bash
cd images/kerberos
docker build -t confluentinc/cp-kerberos:5.0.1 .
cd ../../kafka-cluster-sasl
export KAFKA_SASL_PROMETHEUS_DIR=`pwd`/prometheus
export KAFKA_SASL_SECRETS_DIR=`pwd`/secrets
bash start.sh
```

not complete yet