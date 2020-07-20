// const String apiPath = 'apiPublicMobile/methadone';
const String domenSuffix = 'localhost:8090';
const String protocol = 'http://';
String getBaseApiURL() {
  return '$protocol$domenSuffix/';
}