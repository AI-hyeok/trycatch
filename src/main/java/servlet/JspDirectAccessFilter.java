package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("*.jsp") // 모든 .jsp 파일 요청 필터링
public class JspDirectAccessFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String referer = req.getHeader("Referer");

        // Referer가 없거나 외부 사이트에서 직접 접근한 경우만 차단
        if (uri.endsWith(".jsp") && (referer == null || !referer.contains(req.getServerName()))) {
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }

        chain.doFilter(request, response);
    }
}
