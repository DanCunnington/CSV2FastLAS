class(probe) :- wrong_fragment(0), serror_rate(0), srv_serror_rate(0), dst_host_srv_serror_rate(0), service(private), rerror_rate(0), dst_host_srv_rerror_rate(0).
class(dos) :- logged_in(0), service(private), flag(sf), wrong_fragment(3).
class(probe) :- wrong_fragment(0), srv_diff_host_rate(0), dst_host_serror_rate(3000).
class(dos) :- logged_in(0), serror_rate(0), srv_serror_rate(0), srv_rerror_rate(100000), dst_host_serror_rate(0), dst_host_srv_serror_rate(0), dst_host_srv_rerror_rate(100000).
class(dos) :- logged_in(0), srv_rerror_rate(0), flag(s0), srv_serror_rate(100000), dst_host_serror_rate(100000), dst_host_srv_serror_rate(100000).
class(probe) :- srv_rerror_rate(0), dst_host_srv_rerror_rate(0), dst_host_serror_rate(10000).
class(probe) :- srv_serror_rate(0), dst_host_srv_serror_rate(0), service(private), dst_host_serror_rate(4000).
class(r2l) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), flag(sf), rerror_rate(0), srv_rerror_rate(0), logged_in(1), service(ftp_data).
class(dos) :- serror_rate(0), srv_serror_rate(0), service(private), flag(sf), rerror_rate(0), srv_rerror_rate(0), dst_host_srv_rerror_rate(0), wrong_fragment(1).