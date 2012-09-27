## Jump Line with Lower 2 Digits

At first, map `<Plug>(warp_lower2digits_trigger)` to any keys.

    nmap m <Plug>(warp_lower2digits_trigger)

Now, you can jump line using lower 2 digits of a line number.
Additional, your hands need not leave a home position because
you don't type number keys.

In this plugin, `asdfghjkl;` is mapping to `1234567890`.

I'll show some examples.


- When a cursor is on line 100, and you type `mfg`, you will jump to line 145.
- When 

before   |   your   | after
line num |   input  | line num
------------------------------
   100   |   mfg    |  145
   100   |   mk;    |  180
