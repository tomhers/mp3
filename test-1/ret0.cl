class Main {
  main(): Int {
    {
      (let i: Int <- 0 in
      while i <= 5 loop
        {
          i <- i + 1;
        }
      pool
      );
      1;
    }
  };
};
