alter table ontime partition by range (Year) (
PARTITION p2007 VALUES LESS THAN (2008) ENGINE = InnoDB,
PARTITION p2008 VALUES LESS THAN (2009) ENGINE = InnoDB,
PARTITION p2009 VALUES LESS THAN (2010) ENGINE = InnoDB,
PARTITION p2010 VALUES LESS THAN (2011) ENGINE = InnoDB,
PARTITION p2011 VALUES LESS THAN (2012) ENGINE = InnoDB,
PARTITION p2012 VALUES LESS THAN (2013) ENGINE = InnoDB,
PARTITION p2013 VALUES LESS THAN (2014) ENGINE = InnoDB,
PARTITION p2014 VALUES LESS THAN (2015) ENGINE = InnoDB,
PARTITION p2015 VALUES LESS THAN (2016) ENGINE = InnoDB,
PARTITION p2016 VALUES LESS THAN (2017) ENGINE = InnoDB,
PARTITION p2017 VALUES LESS THAN (2018) ENGINE = InnoDB
);