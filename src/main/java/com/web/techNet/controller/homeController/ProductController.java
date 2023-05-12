package com.web.techNet.controller.homeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.web.techNet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.techNet.repository.CategoryRepo;
import com.web.techNet.repository.ProductRepo;
import com.web.techNet.entity.Product;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryRepo dao;
    @Autowired
    ProductRepo pdao;

    static void list_All_Items(Model model, @Autowired ProductService ps) {
        // get totalsize item
        model.addAttribute("items", ps.findAll());
        List<Product> itemss = ps.findAll();
        int totalItemss = itemss.size();
        model.addAttribute("totalItemss", totalItemss);
    }

    @GetMapping("/")
    public String home(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(18);
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize);
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
            // get size of the page
            Page<Product> list = productService.findByNameContaining(name, pageable);
            int listSize = list.getSize();
            model.addAttribute("totalItems", listSize);
        } else {
            resultPage = productService.findAll(pageable);
            List<Product> items = productService.findAll();
            int totalItems = items.size();
            model.addAttribute("totalItems", totalItems);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 3) {
                if (end == totalPages)
                    start = end - 4;
                else if (start == 1)
                    end = start + 4;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        model.addAttribute("productPage", resultPage);
        return "product/list";
    }

    @RequestMapping("/product/list")
    public String list(Model model, @RequestParam("cid") Optional<Long> cid) {

        if (!cid.isPresent()) {
            return "redirect:/home404";
        }
        List<Product> list = productService.findByCategoryId(cid.get());
        model.addAttribute("item", list);
        // get totalsize item
        List<Product> items = pdao.findByCategoryId(cid.get());
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/product/detail/{productId}")
    public String detail(Model model, @PathVariable("productId") Long id) {
        try {
            Product item = productService.findById(id).get();
            model.addAttribute("item", item);
            model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
            // get totalsize item
            List<Product> items = pdao.findByPhuKien("sạc dự phòng");
            int totalItems = items.size();
            model.addAttribute("totalItems", totalItems);

            // get totalsize item
            list_All_Items(model, productService);
        } catch (Exception e) {
            return "redirect:/home404";
        }
        return "product/detail";
    }

    @GetMapping("/product/search")
    public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) {
        List<Product> list = null;

        if (StringUtils.hasText(name)) {
            list = productService.findByNameContaining(name);
        } else {
            list = productService.findAll();
        }
        model.addAttribute("items", list);
        return "product/list";
    }

    @GetMapping("/view/page")
    public String viewPage(Model model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page) {

        Pageable pageable = PageRequest.of(page.orElse(0), 30, Sort.by("name"));
        Page<Product> pageProduct = null;
        if (StringUtils.hasText(name)) {
            pageProduct = productService.findByNameContaining(name, pageable);
        } else {
            pageProduct = productService.findAll(pageable);
        }
        model.addAttribute("items", pageProduct);
        return "product/list";
    }

    @GetMapping("/search/paginated")
    public String searchPaginated(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {

        int currentPage = page.orElse(1);
        int pageSize = size.orElse(12);
        Pageable pageable = PageRequest.of(currentPage, pageSize, Sort.by("name"));
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
        } else {
            resultPage = productService.findAll(pageable);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 12) {
                if (end == totalPages)
                    start = end - 12;
                else if (start == 1)
                    end = start + 12;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());

            model.addAttribute("pageNumbers", pageNumbers);
        }
        model.addAttribute("productPage", resultPage);

        return "product/list";
    }

    @RequestMapping("/product/list/hotsale")
    public String hotSale(Model model) {
        String hot = "hot-icon.gif";
        model.addAttribute("item", pdao.findByHotSale(hot));
        // get totalsize item
        List<Product> items = pdao.findByHotSale(hot);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/duoi-2-trieu")
    public String price1(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(0, 2000000));
        // get totalsize item
        List<Product> items = pdao.findByUnitPrice(0, 2000000);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/tu-2-4-trieu")
    public String price2(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(2000000, 4000000));
        // get totalsize item
        List<Product> items = pdao.findByUnitPrice(2000000, 4000000);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/tu-4-7-trieu")
    public String price3(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(4000000, 7000000));
        // get totalsize item
        List<Product> items = pdao.findByUnitPrice(4000000, 7000000);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/tu-7-13-trieu")
    public String price4(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(7000000, 13000000));
        // get totalsize item
        List<Product> items = pdao.findByUnitPrice(7000000, 13000000);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/tu-13-20-trieu")
    public String price6(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(13000000, 20000000));
        // get totalsize item
        List<Product> items = pdao.findByUnitPrice(13000000, 20000000);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/tren-20-trieu")
    public String price5(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(20000000, 500000000));
        // get totalsize item
        List<Product> items = pdao.findByUnitPrice(20000000, 500000000);
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/tp-link")
    public String tpLink(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("tp-link"));
        // get totalsize item
        List<Product> items = pdao.findByTheFirm("tp-link");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/toto-link")
    public String totoLink(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("toto-link"));
        // get totalsize item
        List<Product> items = pdao.findByTheFirm("toto-link");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/asus")
    public String asus(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("asus"));
        // get totalsize item
        List<Product> items = pdao.findByTheFirm("asus");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/xiaomi")
    public String xiaomi(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("xiaomi"));
        // get totalsize item
        List<Product> items = pdao.findByTheFirm("xiaomi");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/tenda")
    public String tenda(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("tenda"));
        // get totalsize item
        List<Product> items = pdao.findByTheFirm("tenda");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/mercusys")
    public String mercusys(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("mercusys"));
        // get totalsize item
        List<Product> items = pdao.findByTheFirm("mercusys");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }


    @RequestMapping("/radius-10m")
    public String radius10m(Model model) {
        model.addAttribute("item", pdao.findByRADIUS("/ 10M"));
        // get totalsize item
        List<Product> items = pdao.findByRADIUS("/ 10M");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/radius-15m")
    public String radius15m(Model model) {
        model.addAttribute("item", pdao.findByRADIUS("/ 15M"));
        // get totalsize item
        List<Product> items = pdao.findByRADIUS("/ 15M");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/radius-20m")
    public String radius20m(Model model) {
        model.addAttribute("item", pdao.findByRADIUS("/ 20M"));
        // get totalsize item
        List<Product> items = pdao.findByRADIUS("/ 20M");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/radius-25m")
    public String radius25m(Model model) {
        model.addAttribute("item", pdao.findByRADIUS("/ 25M"));
        // get totalsize item
        List<Product> items = pdao.findByRADIUS("/ 25M");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/radius-30m")
    public String radius30m(Model model) {
        model.addAttribute("item", pdao.findByRADIUS("/ 30M"));
        // get totalsize item
        List<Product> items = pdao.findByRADIUS("/ 30M");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/radius-40m")
    public String radius40m(Model model) {
        model.addAttribute("item", pdao.findByRADIUS("/ 40M"));
        // get totalsize item
        List<Product> items = pdao.findByRADIUS("/ 40M");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }



    @RequestMapping("/price-cao-den-thap")
    public String caodenthap(Model model) {
        model.addAttribute("item", pdao.findByPriceDESC());
        // get totalsize item
        List<Product> items = pdao.findByPriceDESC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-thap-den-cao")
    public String thapdencao(Model model) {
        model.addAttribute("item", pdao.findByPriceASC());
        // get totalsize item
        List<Product> items = pdao.findByPriceASC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-giam")
    public String giam(Model model) {
        model.addAttribute("item", pdao.findByDiscountDESC());
        // get totalsize item
        List<Product> items = pdao.findByDiscountDESC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-sale-flash")
    public String sieu_sale(Model model) {
        model.addAttribute("item", pdao.findBySaleFlash());
        // get totalsize item
        List<Product> items = pdao.findBySaleFlash();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/phu-kien")
    public String phu_kien__sac(Model model) {
        model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
        // get totalsize item
        List<Product> items = pdao.findByPhuKien("sạc dự phòng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-sac-nhanh")
    public String sac_nhanh1(Model model) {
        model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
        // get totalsize item
        List<Product> items = pdao.findByPhuKien("sạc dự phòng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

}
