(defparameter *player-health* nil)
(defparameter *player-agility* nil)
(defparameter *player-strength* nil)

(defparameter *monsters* nil)
(defparameter *monster-builders* nil)
(defparameter *monster-num* 12)

(defun orce-battle ()
  (init-monsters)
  (init-players)
  (game-loop)
  (when (player-died)
    (princ "You have been killed. Game Over."))
  (when (monsters-died)
    (princ "Congratulations! You have vanquished all of your foes.")))

(defun game-loop ()
  (unless (or (player-dead) (monsters-dead))
    (show-player)
    (dotimes (k (1+ (truncate (/ (max 0 *player-agility*) 15))))
      (unless (monsters-dead)
        (show-monsters)
        (player-attack)))
    (fresh-line)
    (map 'list
         (lambda (m)
           (or (monster-dead m) (moster-attack m)))
         *monsters*)
    (game-loop)))

(dotimes (i 3)
  (princ i))

(defun init-player ()
  (setf *player-health* 30)
  (setf *player-agility* 30)
  (setf *player-strength* 30))

(defun player-dead ()
  (<= *player-health* 0))


(defun show-player ()
  (fresh-line)
  (princ "You are a valiant knight with a health of ")
  (princ *player-health*)
  (princ ", an agility of ")
  (princ *player-agility*)
  (princ ", and a strength of ")
  (princ *player-strength*))






(defmethod monster-attack (m))



(push #'make-orc *monster-builders*)

*monster-builders*

(defparameter *gurag* (make-orc))

(monster-show *gurag*)

(defparameter *binky* (make-monster))

*binky*

*gurag*



(defstruct monster (health (random 10)))

(defstruct (orc (:include monster)) (club-level (random 8)))

(defmethod monster-show (m)
  (princ "A fierce ")
  (princ (type-of m)))

(defmethod monster-show ((m orc))
  (princ "A wicked orc with a level ")
  (princ (orc-club-level m))
  (princ " club"))


(monster-show *gurag*)
