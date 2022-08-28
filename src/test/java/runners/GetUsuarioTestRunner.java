package runners;

import com.intuit.karate.junit5.Karate;

public class GetUsuarioTestRunner {

    @Karate.Test
    public Karate runGetusuarios() {
        return Karate.run("classpath:features/usuarios/GetUsuarios.feature");
    }
}
