      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT    Input-FD
               ASSIGN "DATSET1.TXT"
               ORGANIZATION LINE SEQUENTIAL.
           SELECT  Print-FD
               ASSIGN TO LINE ADVANCING FILE "Prog1Print.txt".
       DATA DIVISION.
       FILE SECTION.
       FD  Input-FD.
       01  Input-Rec                                  PIC x(80).

       FD  Print-FD.
       01  Print-Rec.
           05  FILLER                                 PIC x(26).
           05  CENTER                                 Pic X(20).
           05  FILLER                                 PIC x(26).

       WORKING-STORAGE SECTION.
       01  Switches.
           05  EOD                                    PIC XXX.

       PROCEDURE DIVISION.
       000-MAINLINE.
           OPEN INPUT  Input-FD
                OUTPUT Print-FD
           PERFORM 100-INITIALIZE.

           PERFORM UNTIL EOD = "YES"
               READ Input-FD
                   AT END
                       MOVE "YES" TO EOD
                   NOT AT END
                       PERFORM 200-PROCESSING
               END-READ
           END-PERFORM

           CLOSE Input-FD
                 Print-FD
           STOP RUN.

       100-INITIALIZE.
           MOVE "NO " TO EOD
           MOVE SPACES TO Print-Rec.

       200-PROCESSING.
           MOVE Input-Rec TO CENTER
           WRITE Print-Rec
               AFTER ADVANCING 2 LINES.


       END PROGRAM Program01.
