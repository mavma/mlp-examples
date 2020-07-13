type(pf_pfasst_t)  :: pf       !<  the main pfasst structure
type(pf_comm_t)    :: comm     !<  the communicator (here it is mpi)
type(scalar_encap) :: y_0      !<  the initial condition
type(scalar_encap) :: y_end    !<  the solution at the final time
character(256)     :: pf_fname !<  file name for input of PFASST parameters
integer ::  l, ierror

call mpi_init(ierror)

call initialize_problem_parameters() ! get problem specific parameters (defined by user)
call pf_mpi_create(comm, MPI_COMM_WORLD) ! initializes the LibPFASST communicator
call pf_pfasst_create(pf, comm, fname=pf_fname) ! initializes the main LibPFASST structure

        !> Loop over levels and set some level specific parameters
        do l = 1, pf%nlevels
            !>  Allocate the user specific level object
            allocate(my_level_t::pf%levels(l)%ulevel)

            !>  Allocate the user specific data constructor
            allocate(scalar_factory::pf%levels(l)%ulevel%factory)

            !>  Add the sweeper to the level
            allocate(my_sweeper_t::pf%levels(l)%ulevel%sweeper)

            !>  Set the size of the data on this level (here just one)
            call pf_level_set_size(pf,l,[1])
        end do

        !>  Set up some pfasst stuff
        call pf_pfasst_setup(pf)

        !>  Add some hooks for output
        call pf_add_hook(pf, -1, PF_POST_ITERATION, echo_error)

        !>  Output run parameters
        call print_loc_options(pf,un_opt=6)

        !> Set the initial condition
        call y_0%setval(1.0_pfdp)

        !> Do the PFASST time stepping
        call pf_pfasst_run(pf, y_0, dt, 0.0_pfdp, nsteps,y_end)

        !>  Wait for everyone to be done
        call mpi_barrier(pf%comm%comm, ierror)

        !>  Deallocate pfasst structure
        call pf_pfasst_destroy(pf)

call mpi_finalize(ierror)