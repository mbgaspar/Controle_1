function print_lugar_raizes(G, window_i)
    show_window(window_i);
    evans(G);
    l=gca();
    l.x_location = "origin"
    l.y_location = "origin"
endfunction


