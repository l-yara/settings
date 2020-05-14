;;; eshell.el -- set of project-specific eshell functions
;;;
;;; Commentary:

;;; Code:

;;Code
;; eshell T&Ts: aliases, functions etc
;; require package:
;; (prelude-require-packages '(some-package some-other-package))
(require 'eshell)

; eshell details
(defvar src-dir "E:\\svn\\arccore\\")
 (setq tutorial-dir "C:\\app\\tutorial\\450.0.0-SNAPSHOT\\")
 (setq dest-dir (concat tutorial-dir "codebase\\jars"))
 (setq tutorial-bin (concat tutorial-dir "bin\\"))

 (setq process-buffer "*eshell*<process>")

 (defun eshell/deploy-yes (&optional arg)
   "Some comment here.  Passes ARG to 'comment-dwim' when provided."
   (interactive "*P")
   (eshell/cp (concat src-dir "yes\\target\\yes.jar") dest-dir))

 (setq src-transport-dir "E:\\svn\\olap-transport\\")

 (setq src-jdbc-dir "E:\\svn\\jdbc\\")
 (setq src-arc-kernel-dir "E:\\svn\\arc-kernel\\")
 (setq src-jdbc-comp-dir "E:\\svn\\jdbc-compatibility-tests\\")

 (defun eshell/mvn-transport (&optional arg)
   "Build the whole arc-olap-transport project.  ARG is passed to the end of command line."
   (interactive "*P")
   (start-process-shell-command "mvn-transport" process-buffer (concat "mvn -f " src-transport-dir "pom.xml clean install -DskipTests -DskipDocs " arg))
   )

(defun eshell/mvn-arc-kernel (&optional arg)
  "Build the whole arc-kernel project.  ARG is passed to the end of command line."
  (interactive "*P")
  (start-process-shell-command "mvn-arc-kernel" process-buffer (concat "mvn -f " src-arc-kernel-dir "pom.xml clean install -DskipTests -DskipDocs " arg))
  )

 (defun eshell/mvn-jdbc (&optional arg)
   "Build the whole jdbc project.  ARG is passed to the end of command line."
   (interactive "*P")
   (start-process-shell-command "mvn-jdbc-common" process-buffer (concat "mvn -f " src-jdbc-dir "common\\pom.xml clean install -DskipTests -DskipDocs " arg))
   (start-process-shell-command "mvn-jdbc-driver" process-buffer (concat "mvn -f " src-jdbc-dir "driver\\pom.xml clean install -DskipTests -DskipDocs " arg))
   )

 ;; alias mvn-yes mvn -f E:\svn\arc-transport\pom.xml clean install -DskipTests -DskipDocs; mvn -f E:\svn\arccore\yes\pom.xml clean install -DskipTests -DskipDocs
 (defun eshell/mvn-yes (&optional arg)
   "Build the whole arc-olap-transport project.  ARG is passed to the end of command line."
   (interactive "*P")
   (eshell/mvn-arc-kernel arg)
   (eshell/mvn-jdbc arg)
   (eshell/mvn-transport arg)
   ;; (start-process-shell-command "mvn-build" process-buffer (concat "mvn -f " src-dir "build\\pom.xml clean install -DskipTests -DskipDocs -U" arg))
   (start-process-shell-command "mvn-yes" process-buffer (concat "mvn -f " src-dir "yes\\pom.xml clean install -DskipTests -DskipDocs -U" arg))
   )

 (defun eshell/deploy-transport (&optional arg)
   "Deploy the built arc-olap-transport parts.  ARG is not used."
   (interactive "*P")
   (eshell/cp (concat src-transport-dir "arc-olap-common\\target\\arc-olap-common-1.0.4-SNAPSHOT.jar") dest-dir)
   (eshell/cp (concat src-transport-dir "arc-olap-samples\\target\\arc-olap-samples-1.0.4-SNAPSHOT.jar") dest-dir)
   (eshell/cp (concat src-transport-dir "arc-olap-driver\\target\\arc_olap4j100.jar") dest-dir)
   )

 ;; (defalias 'eshell/ll '"ls -al")
;; alias mvn-transport mvn -f E:\svn\olap-transport\pom.xml clean install -DskipTests -DskipDocs
(defun eshell/mvn-tutorial (&optional arg)
  "Some comment here.  Passes ARG to 'deploy-transport' when provided."
  (interactive "*P")
  ;; (start-process-shell-command "mvn-tutorial" (current-buffer) (concat "mvn -f " src-dir "tutorial\\pom.xml clean install -DskipTests -DskipDocs " arg))
  (start-process-shell-command "mvn-tutorial" process-buffer (concat "mvn -f " src-dir "tutorial\\pom.xml clean install -DskipTests -DskipDocs " arg))
)

(defun eshell/svn-all (&optional arg)
  "Update whole trunk.  Passes ARG to 'svn update' when provided."
  (interactive "*P")
  (eshell/cd src-arc-kernel-dir)
  (start-process-shell-command "svn-arc-kernel" process-buffer (concat "svn up " arg))
  (eshell/cd src-jdbc-dir)
  (start-process-shell-command "svn-jdbc" process-buffer (concat "svn up " arg))
  (eshell/cd src-jdbc-comp-dir)
  (start-process-shell-command "svn-jdbc-comp" process-buffer (concat "svn up " arg))
  (eshell/cd src-transport-dir)
  (start-process-shell-command "svn-transport" process-buffer (concat "svn up " arg))
  (eshell/cd src-dir)
  (start-process-shell-command "svn-arccore" process-buffer (concat "svn up " arg))
)

(defun eshell/start-all (&optional arg)
  "Start tutorial.  Passes ARG to 'svn update' when provided."
  (interactive "*P")
  (delete-directory (concat tutorial-dir "Server1\\storage\\javac") 1)
  (eshell/cd tutorial-bin)
  (start-process-shell-command "start-all" process-buffer (concat tutorial-bin "start.cmd -all " arg))
)

(defun eshell/stop-all (&optional arg)
  "Start tutorial.  Passes ARG to 'svn update' when provided."
  (interactive "*P")
  (eshell/cd tutorial-bin)
  (start-process-shell-command "stop-all" process-buffer (concat tutorial-bin "stop.cmd -all " arg))
)


;; alias stop-all cd C:\app\tutorial\444.0.0-SNAPSHOT\bin;C:\app\tutorial\444.0.0-SNAPSHOT\bin\stop.cmd -all
;; alias start-all cd C:\app\tutorial\444.0.0-SNAPSHOT\bin;C:\app\tutorial\444.0.0-SNAPSHOT\bin\start.cmd -all

;;TODO java -jar tutorial/prophet/target/tutorial.prophet.installer-444.0.0-SNAPSHOT.jar

(provide 'eshell)
;;; eshell.el ends herqe
