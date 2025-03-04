package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("*.comboard") // 서블릿 경로 필터링
public class ServletDirectAccessFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String referer = req.getHeader("Referer");

        // Referer가 없거나 현재 사이트 도메인을 포함하지 않으면 차단
        if (referer == null || !referer.contains(req.getServerName())) {
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }

        chain.doFilter(request, response);
    }
}
