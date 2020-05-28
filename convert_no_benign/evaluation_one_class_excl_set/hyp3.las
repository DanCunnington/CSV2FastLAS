class(dos) :- flag(sf), logged_in(0), dst_host_srv_rerror_rate(0), service(private), wrong_fragment(3).
class(probe) :- flag(sf), wrong_fragment(0), serror_rate(0), rerror_rate(0), dst_host_srv_serror_rate(0), service(private).
class(probe) :- flag(sf), wrong_fragment(0), serror_rate(0), srv_serror_rate(0), rerror_rate(0), service(private).
class(probe) :- flag(sf), wrong_fragment(0), serror_rate(0), srv_serror_rate(0), rerror_rate(0), dst_host_srv_serror_rate(0), dst_host_srv_rerror_rate(0), service(private).
class(probe) :- flag(sf), wrong_fragment(0), serror_rate(0), srv_serror_rate(0), rerror_rate(0), dst_host_srv_rerror_rate(0), service(private).
class(probe) :- wrong_fragment(0), serror_rate(0), srv_serror_rate(0), dst_host_srv_serror_rate(0), dst_host_srv_rerror_rate(0), service(private).
class(probe) :- wrong_fragment(0), srv_serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(3000).
class(dos) :- logged_in(0), serror_rate(0), srv_serror_rate(0), dst_host_serror_rate(0), dst_host_srv_serror_rate(0), flag(rej), srv_rerror_rate(100000), dst_host_srv_rerror_rate(100000).
class(dos) :- srv_rerror_rate(0), dst_host_srv_rerror_rate(0), dst_host_serror_rate(100000), dst_host_srv_serror_rate(100000).
class(probe) :- dst_host_serror_rate(10000).
class(dos) :- logged_in(0), serror_rate(0), srv_serror_rate(0), dst_host_serror_rate(0), dst_host_srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), dst_host_srv_rerror_rate(100000), flag(rsto).
class(probe) :- srv_serror_rate(0), dst_host_srv_serror_rate(0), service(private), dst_host_serror_rate(4000).
class(r2l) :- flag(sf), serror_rate(0), rerror_rate(0), srv_rerror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(ftp_data), logged_in(1).
class(dos) :- flag(sf), serror_rate(0), rerror_rate(0), srv_rerror_rate(0), dst_host_serror_rate(0), dst_host_srv_serror_rate(0), service(http), logged_in(1), dst_host_srv_rerror_rate(5000).
class(probe) :- serror_rate(0), dst_host_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(finger), flag(rstos0), dst_host_srv_rerror_rate(12000).
class(dos) :- flag(sf), logged_in(0), serror_rate(0), rerror_rate(0), dst_host_srv_serror_rate(0), service(private), wrong_fragment(1).
class(probe) :- serror_rate(0), srv_serror_rate(0), dst_host_srv_serror_rate(0), srv_rerror_rate(100000), dst_host_srv_rerror_rate(100000), service(private), flag(rstr).