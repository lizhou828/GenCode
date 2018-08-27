import com.github.pagehelper.Page;
import com.liz.model.IllegalWords;
import com.liz.service.IllegalWordsService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by lizhou on 2018年05月16日 21时29分
 */
public class IllegalWordsServiceTest extends BaseUnitTest {

    @Autowired
    private IllegalWordsService illegalWordsService;

    @Test
    public void getByPKTest() {
        IllegalWords illegalWords = illegalWordsService.getByPK(44);
        System.out.println("illegalWords=" + illegalWords);
    }

    @Test
    public void findByPageTest() {
        Page<IllegalWords> page = new Page<IllegalWords>();
        page.setPageNum(1);
        page.setPageSize(20);
        Page<IllegalWords> pageInfo  = illegalWordsService.findByPage(page, new IllegalWords());
        System.out.println("pageInfo="+pageInfo );
    }


}
