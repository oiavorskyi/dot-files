function java11 --description 'Switches JAVA_HOME to Java 11'
  set -gx JAVA_HOME (/usr/libexec/java_home -v11);
end
