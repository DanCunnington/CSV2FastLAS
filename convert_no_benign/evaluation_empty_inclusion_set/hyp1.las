class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), dst_host_serror_rate(0), service(ecr_i).
class(dos) :- diff_srv_rate(0), dst_host_serror_rate(0), service(ecr_i).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(0).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), dst_host_serror_rate(0), service(ecr_i).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(4000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(2000).
class(dos) :- diff_srv_rate(0), wrong_fragment(1).
class(dos) :- serror_rate(0), diff_srv_rate(0), dst_host_serror_rate(0), service(ecr_i).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_serror_rate(1000).
class(dos) :- same_srv_rate(100000), srv_diff_host_rate(0), dst_host_serror_rate(2000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(5000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(16000).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(18000).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(50000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(20000).
class(probe) :- service(eco_i), wrong_fragment(0), srv_diff_host_rate(0), dst_host_serror_rate(53000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), service(ecr_i), dst_host_diff_srv_rate(17000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(9000).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(10000).
class(dos) :- srv_diff_host_rate(0), wrong_fragment(3).
class(probe) :- service(eco_i), dst_host_serror_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(75000).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(67000).
class(probe) :- service(eco_i), dst_host_serror_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(31000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(13000).
class(probe) :- service(eco_i), dst_host_serror_rate(3000).
class(probe) :- wrong_fragment(0), serror_rate(0), service(other), same_srv_rate(3000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_serror_rate(5000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_serror_rate(7000).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(8000).
class(probe) :- service(eco_i), wrong_fragment(0), serror_rate(0), srv_diff_host_rate(100000), dst_host_diff_srv_rate(0), dst_host_serror_rate(0).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(7000).
class(probe) :- service(eco_i), serror_rate(0), dst_host_serror_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(17000).
class(dos) :- wrong_fragment(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(11000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), dst_host_diff_srv_rate(0), dst_host_serror_rate(0), service(tim_i).
class(probe) :- dst_host_serror_rate(0), same_srv_rate(1000).
class(probe) :- service(eco_i), dst_host_serror_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(100000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_serror_rate(3000).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(15000).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(19000).