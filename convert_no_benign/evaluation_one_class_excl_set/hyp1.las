class(probe) :- service(eco_i), dst_host_diff_srv_rate(0).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(0), dst_host_serror_rate(0), srv_diff_host_rate(100000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), dst_host_serror_rate(0), service(ecr_i).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), dst_host_serror_rate(0), service(ecr_i).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), service(ecr_i), dst_host_diff_srv_rate(4000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), service(ecr_i), dst_host_diff_srv_rate(2000).
class(dos) :- same_srv_rate(100000), service(ecr_i), wrong_fragment(1).
class(dos) :- serror_rate(0), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(3000), dst_host_serror_rate(1000).
class(probe) :- wrong_fragment(0), serror_rate(0), srv_diff_host_rate(0), service(private), same_srv_rate(83000), diff_srv_rate(9000), dst_host_diff_srv_rate(71000), dst_host_serror_rate(6000).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(2000).
class(dos) :- serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), service(ecr_i), dst_host_diff_srv_rate(5000).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(18000).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(50000).
class(probe) :- service(eco_i), wrong_fragment(0), srv_diff_host_rate(0), dst_host_serror_rate(53000).
class(dos) :- diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(17000).
class(dos) :- same_srv_rate(100000), srv_diff_host_rate(0), dst_host_diff_srv_rate(9000).
class(dos) :- srv_diff_host_rate(0), service(private), wrong_fragment(3).
class(dos) :- same_srv_rate(100000), dst_host_diff_srv_rate(10000).
class(probe) :- service(eco_i), wrong_fragment(0), serror_rate(0), same_srv_rate(100000), srv_diff_host_rate(0), dst_host_diff_srv_rate(75000).
class(probe) :- serror_rate(0), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(urp_i), dst_host_diff_srv_rate(60000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(private), same_srv_rate(22000), dst_host_diff_srv_rate(47000), diff_srv_rate(28000).
class(dos) :- wrong_fragment(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(20000).
class(probe) :- service(eco_i), dst_host_diff_srv_rate(67000).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_serror_rate(3000).
class(probe) :- service(eco_i), wrong_fragment(0), serror_rate(0), same_srv_rate(100000), srv_diff_host_rate(0), dst_host_diff_srv_rate(31000).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(13000).
class(probe) :- service(eco_i), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(3000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(other), same_srv_rate(3000).
class(dos) :- dst_host_serror_rate(5000).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(7000).
class(probe) :- service(eco_i), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(8000).
class(probe) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(private), dst_host_diff_srv_rate(28000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), dst_host_diff_srv_rate(3000), service(private), diff_srv_rate(1000), same_srv_rate(93000).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(7000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), dst_host_diff_srv_rate(4000), service(private), same_srv_rate(92000), diff_srv_rate(2000).
class(probe) :- service(eco_i), serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), dst_host_diff_srv_rate(17000).
class(dos) :- wrong_fragment(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(11000).
class(dos) :- same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(0), dst_host_serror_rate(0), service(tim_i).
class(probe) :- same_srv_rate(1000).
class(probe) :- wrong_fragment(0), serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(16000), service(private), same_srv_rate(5000), diff_srv_rate(21000), dst_host_diff_srv_rate(88000).
class(probe) :- service(eco_i), wrong_fragment(0), serror_rate(0), same_srv_rate(100000), srv_diff_host_rate(0), dst_host_diff_srv_rate(100000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), dst_host_diff_srv_rate(13000), service(other), same_srv_rate(9000), diff_srv_rate(73000).
class(probe) :- wrong_fragment(0), serror_rate(0), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), dst_host_diff_srv_rate(7000), service(private).
class(dos) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(15000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(private), diff_srv_rate(60000), same_srv_rate(60000), dst_host_diff_srv_rate(36000).
class(probe) :- wrong_fragment(0), serror_rate(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), dst_host_diff_srv_rate(6000), dst_host_serror_rate(1000).
class(dos) :- diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(16000).
class(dos) :- wrong_fragment(0), same_srv_rate(100000), diff_srv_rate(0), srv_diff_host_rate(0), service(ecr_i), dst_host_diff_srv_rate(19000).
class(probe) :- serror_rate(0), srv_diff_host_rate(0), dst_host_serror_rate(0), service(private), same_srv_rate(44000), diff_srv_rate(7000), dst_host_diff_srv_rate(23000).