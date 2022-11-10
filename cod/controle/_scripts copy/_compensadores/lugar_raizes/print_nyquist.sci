function print_nyquist(G, window_i)
    show_window(window_i);
    nyquist(G, 1E-6, 1E+6);
    show_margins(G, 'nyquist');
    [mf ,fg]=p_margin(G);
    disp("Nyq: fg, mf");
    disp(fg,mf);
    [mg,ff]=g_margin(G);
    disp("Nyq: ff, mg");
    disp(ff,mg);
    l=gca();
    l.x_label.text= 'Re[GH(jw)]';
    l.y_label.text= 'Im[GH(jw)]';
    l.x_location = "origin"
    l.y_location = "origin"
endfunction

