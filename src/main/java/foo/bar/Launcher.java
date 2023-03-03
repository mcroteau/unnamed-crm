package foo.bar;

import net.plsar.PLSAR;
import net.plsar.ViewConfig;

public class Launcher {
    public static void main(String[] args){
        PLSAR plsar = new PLSAR(9000);

        ViewConfig viewConfig = new ViewConfig();
        viewConfig.setViewsPath("webapp");
        plsar.setViewConfig(viewConfig);

        plsar.start();
    }
}
