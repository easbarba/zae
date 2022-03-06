package pak;

import java.nio.file.Paths;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class ConfigTest {
    @Test
    void hasCorrectHomeConfigLocation() {
        var homeDir = System.getProperty("user.home");
        var homeConf = Paths.get(homeDir, ".config", "pak").toString();

        var conf = new Config();
        assertEquals(homeConf, conf.homeConfig());
    }
}
