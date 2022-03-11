package pak;

import java.nio.file.Paths;

public class Config {
    public String homeConfig() {
        var homeDir = System.getProperty("user.home");
        var homeConf = Paths.get(homeDir, ".config", "pak").toString();

        return homeConf;
    }

    // distro which executable was found in user set location
    String found();

    // all distro configurations
    String[] all();

    // distro executable
    String Exec();
}
