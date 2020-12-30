package model.vo;

public class VisitVo {

    public class VisitCountVO{
        private int visit_id;
        private int visit_ip;
        private int visit_time;
        private int visit_refer;
        private int visit_agent;

        //constructor/setter/getter 생략


        public int getVisit_id() {
            return visit_id;
        }

        public void setVisit_id(int visit_id) {
            this.visit_id = visit_id;
        }

        public int getVisit_ip() {
            return visit_ip;
        }

        public void setVisit_ip(int visit_ip) {
            this.visit_ip = visit_ip;
        }

        public int getVisit_time() {
            return visit_time;
        }

        public void setVisit_time(int visit_time) {
            this.visit_time = visit_time;
        }

        public int getVisit_refer() {
            return visit_refer;
        }

        public void setVisit_refer(int visit_refer) {
            this.visit_refer = visit_refer;
        }

        public int getVisit_agent() {
            return visit_agent;
        }

        public void setVisit_agent(int visit_agent) {
            this.visit_agent = visit_agent;
        }
    }
}
