docker-compose create kerberos
docker-compose start kerberos
for principal in zookeeper1 zookeeper2 zookeeper3
do
  rm -rf secrets/${principal}.keytab
  docker-compose exec kerberos kadmin.local -q "addprinc -randkey zookeeper/quickstart.confluent.io@TEST.CONFLUENT.IO"
  docker-compose exec kerberos kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab zookeeper/quickstart.confluent.io@TEST.CONFLUENT.IO"
done
for principal in zkclient1 zkclient2 zkclient3
do
  rm -rf secrets/${principal}.keytab
  docker-compose exec kerberos kadmin.local -q "addprinc -randkey zkclient/quickstart.confluent.io@TEST.CONFLUENT.IO"
  docker-compose exec kerberos kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab zkclient/quickstart.confluent.io@TEST.CONFLUENT.IO"
done
for principal in broker1 broker2 broker3
do
  rm -rf secrets/${principal}.keytab
  docker-compose exec kerberos kadmin.local -q "addprinc -randkey kafka/quickstart.confluent.io@TEST.CONFLUENT.IO"
  docker-compose exec kerberos kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab kafka/quickstart.confluent.io@TEST.CONFLUENT.IO"
done
for principal in saslproducer saslconsumer
do
  rm -rf secrets/${principal}.keytab
  docker-compose exec kerberos kadmin.local -q "addprinc -randkey ${principal}/quickstart.confluent.io@TEST.CONFLUENT.IO"
  docker-compose exec kerberos kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab ${principal}/quickstart.confluent.io@TEST.CONFLUENT.IO"
done
docker-compose create
docker-compose start
