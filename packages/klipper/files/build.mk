

SOURCES=pyhelper.c serialqueue.c stepcompress.c itersolve.c trapq.c \
    kin_cartesian.c kin_corexy.c kin_delta.c kin_polar.c \
    kin_rotary_delta.c kin_winch.c kin_extruder.c 

OBJECTS=$(patsubst %,$(OBJDIR)/%,$(SOURCES:.c=.o))

LIB=c_helper.so

all: $(LIB)

$(OBJDIR)/%.o: %.c $(DEPS)
		$(CC) -c -o $@ $< $(CFLAGS)

$(LIB): $(OBJECTS)
		$(CC) -o $@ $^ $(LDLAGS) -shared -fPIC -flto -fwhole-program -fno-use-linker-plugin