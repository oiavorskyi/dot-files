function java13 --description 'Switches JAVA_HOME to Java 13'
  set -gx JAVA_HOME (/usr/libexec/java_home -v13);
end
