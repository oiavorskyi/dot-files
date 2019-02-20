function java8 --description 'Switches JAVA_HOME to Java 8'
  set -gx JAVA_HOME (/usr/libexec/java_home -v1.8);
end
