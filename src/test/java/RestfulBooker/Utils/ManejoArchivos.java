package RestfulBooker.Utils;

import java.nio.file.Path;
import java.nio.file.Paths;


public final class ManejoArchivos {

        public static boolean fileExist(String fileName) {
                boolean llExist = false;

                Path path = Paths.get(fileName);
                if (path.toFile().isFile()) {
                        llExist = true;
                }
                return llExist;
        }
}
