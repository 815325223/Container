CREATE DATABASE slurm_acct_db;
CREATE DATABASE slurm_jobcomp_db;
CREATE USER 'slurm'@'%' IDENTIFIED BY 'slurm';
GRANT All privileges ON slurm_acct_db.* TO 'slurm'@'%';
GRANT All privileges ON slurm_jobcomp_db.* TO 'slurm'@'%';
