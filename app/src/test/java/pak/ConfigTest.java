package pak;

import java.nio.file.Paths;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThat;

class ConfigTest {
    @Test
    void hasCorrectHomeLocation() {
        var homeDir = System.getProperty("user.home");
        var conf = new Config().homeConfig();

        assertThat(homeDir, StartsWith(conf));
    }
}
