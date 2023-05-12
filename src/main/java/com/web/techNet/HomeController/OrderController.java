package com.web.techNet.HomeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;

import com.web.techNet.service.OrderDetailService;
import com.web.techNet.service.OrderService;
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

import com.web.techNet.repository.OrderRepo;
import com.web.techNet.entity.Order;
import com.web.techNet.entity.Product;

@Controller
@RequestMapping("orderHistory")
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    OrderRepo odao;

    @Autowired
    ProductService productService;

    private void All_item(Model model) {
        model.addAttribute("item", productService.findAll());
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
    }

    @GetMapping("/order/checkout")
    public String checkout(Model model) {
        return "order/checkout";
    }

    @GetMapping("/list")
    public String searchOrdersByUsername(ModelMap model, HttpServletRequest request,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {

        String username = request.getRemoteUser();
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);

        Pageable pageable = PageRequest.of(currentPage - 1, pageSize);
        Page<Order> resultPage;

        if (StringUtils.hasText(name)) {
            resultPage = orderService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
            long totalSize = orderService.countByNameContaining(name);
            model.addAttribute("totalSize", totalSize);
        } else {
            resultPage = orderService.findByUsername(username, pageable);
            long totalSize = orderService.countByUsername(username);
            model.addAttribute("totalSize", totalSize);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 5) {
                if (end == totalPages)
                    start = end - 5;
                else if (start == 1)
                    end = start + 5;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        model.addAttribute("orderPage", resultPage);
        // get totalsize item
        model.addAttribute("item", productService.findAll());
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize2);
        long totalSize3 = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize3);
        long totalSize4 = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize4);
        return "order/history";
    }

    @GetMapping("/detail/{orderId}")
    public String detail(@PathVariable("orderId") Long orderId, Model model) {
        try {
            model.addAttribute("order", orderService.findById(orderId));
            // get totalsize item
            All_item(model);
            return "order/detail";
        } catch (Exception e) {
            return "redirect:/home404";
        }
    }

    @GetMapping("/confirmation")
    public String listConfirmation(Model model, HttpServletRequest request,
            @RequestParam("page") Optional<Integer> page) {
        String status = "Đang chờ xác nhận";
        String username = request.getRemoteUser();
        model.addAttribute("orders", odao.findByStatus(status, username));
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsername(username);
        model.addAttribute("totalSize", totalSize2);
        return "order/historyByStatus";
    }

    @GetMapping("/transported")
    public String listTransported(Model model,
            HttpServletRequest request) {
        String username = request.getRemoteUser();
        String status = "Đang vận chuyển";
        model.addAttribute("orders", odao.findByStatus(status, username));
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize);
        long totalSize2 = orderService.countByUsername(username);
        model.addAttribute("totalSize", totalSize2);
        return "order/historyByStatus";
    }

    @GetMapping("/cancel")
    public String listDelivery(Model model, HttpServletRequest request) {
        String status = "Đã hủy";
        String username = request.getRemoteUser();
        model.addAttribute("orders", odao.findByStatus(status, username));
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize);
        long totalSize2 = orderService.countByUsername(username);
        model.addAttribute("totalSize", totalSize2);
        return "order/historyByStatus";
    }

    @GetMapping("/delivered")
    public String listEvaluate(Model model, HttpServletRequest request) {
        String status = "Đã giao hàng";
        String username = request.getRemoteUser();
        model.addAttribute("orders", odao.findByStatus(status, username));
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize);
        long totalSize2 = orderService.countByUsername(username);
        model.addAttribute("totalSize", totalSize2);
        return "order/historyByStatus";
    }

    @GetMapping("/view/page")
    public String viewPage(Model model, HttpServletRequest request,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page) {

        Pageable pageable = PageRequest.of(page.orElse(0), 100, Sort.by("name"));
        Page<Order> pageProduct = null;
        String username = request.getRemoteUser();

        pageProduct = orderService.findByUsername(username, pageable);
        model.addAttribute("orders", pageProduct);
        // get totalsize item
        All_item(model);
        return "order/history";
    }

}
