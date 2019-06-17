function java12 --description 'Switches JAVA_HOME to Java 12'
  set -gx JAVA_HOME (/usr/libexec/java_home -v12);
end
