package pak;

import java.nio.file.Paths;

public class Config {
    public String homeConfig() {
        var homeDir = System.getProperty("user.home");
        var homeConf = Paths.get(homeDir, ".config", "pak").toString();

        return homeConf;
    }
}
