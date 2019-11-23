// https://repl.it/repls/HarmoniousAlertAstrophysics
/**
 https://stackoverflow.com/questions/3758606/how-to-convert-byte-size-into-human-readable-format-in-java
*/
class humanReadable {

  public static String humanReadableByteCount(long bytes, boolean si) {
    int unit = si ? 1000 : 1024;
    if (bytes < unit) return bytes + " B";
    int exp = (int) (Math.log(bytes) / Math.log(unit));
    String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp-1) + (si ? "" : "i");
    return String.format("%.2f %sB", bytes / Math.pow(unit, exp), pre);
  }

  public static void main(String[] args) {
    if(args.length < 1){
      System.out.println("usage: [-si] number");
      System.exit(0);
    }
    System.out.println(humanReadableByteCount(
      args.length > 1 ? Long.parseLong(args[1]) : 
                        Long.parseLong(args[0]), 
      args.length > 1 ? false : true ));
  }
}
