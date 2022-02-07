#pragma once

enum Beverage { ALE, LAGER=10, STOUT, PILSNER, PILZ=PILSNER };

int print_args(char **argv);

char **get_args();

char* get_me();

int get_string(char** res);
