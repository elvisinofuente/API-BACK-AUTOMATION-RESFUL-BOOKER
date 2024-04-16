package RestfulBooker;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Collection;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

// import static org.junit.jupiter.api.Assertions.assertEquals;

public class RestfulBookerTest {

    @Test
    public void testParallel() throws Exception {
        try {

            Results results = Runner.path("classpath:RestfulBooker")
                    // .tags(tags)
                    .outputCucumberJson(true)
                    .parallel(5);

            generateReport(results.getReportDir());
            //assertEquals(0, results.getFailCount(), results.getErrorMessages());
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "api-back-RestfulBooker");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
