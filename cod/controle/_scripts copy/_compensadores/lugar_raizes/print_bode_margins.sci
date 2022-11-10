function print_bode_margins(G, window_i)
    show_window(window_i);
    [mf ,fg]=p_margin(G);
    disp("print_bode_margins: mf, fg");
    disp(mf,fg);
    [mg,ff]=g_margin(G);
    disp("print_bode_margins: mg, ff");
    disp(mg,ff);
    show_margins(G);    
endfunction
