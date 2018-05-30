namespace Quantum.TwoQbitGrover
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Grover () : ( ( Result, Result ) )
    {
        body
        {
			mutable q0_r = Zero;
			mutable q1_r = Zero;

			using ( qbits = Qubit[2] )
			{
				let q0 = qbits[0];
				let q1 = qbits[1];

				Oracle00 ( q0 , q1 );
				//Oracle10 ( q0 , q1 );
				//Oracle01 ( q0 , q1 );
				//Oracle11 ( q0 , q1 );

				GroverDiffusionOperator ( q0 , q1 );
				//GroverDiffusionOperatorTShirt ( q0 , q1 );

				set q0_r = M ( q0 );
				set q1_r = M ( q1 );

				ResetAll ( qbits );
			}

            return ( q0_r , q1_r );
        }
    }

	operation Oracle00 ( q0: Qubit , q1: Qubit ) : ()
	{
		body
		{
			H ( q0 );
			H ( q1 );

			X ( q0 );
			X ( q1 );
			H ( q1 );
			CNOT ( q0 , q1 );
			H ( q1 );
			X ( q1 );
			X ( q0 );
		}
	}

	operation Oracle10 ( q0: Qubit , q1: Qubit ) : ()
	{
		body
		{
			H ( q0 );
			H ( q1 );

			X ( q0 );
			H ( q1 );
			CNOT ( q0 , q1 );
			H ( q1 );
			X ( q0 );
		}
	}

	operation Oracle01 ( q0: Qubit , q1: Qubit ) : ()
	{
		body
		{
			H ( q0 );
			H ( q1 );

			X ( q1 );
			H ( q0 );
			CNOT ( q1 , q0 );
			H ( q0 );
			X ( q1 );
		}
	}

	operation Oracle11 ( q0: Qubit , q1: Qubit ) : ()
	{
		body
		{
			H ( q0 );
			H ( q1 );

			H ( q1 );
			CNOT ( q0 , q1 );
			H ( q1 );
		}
	}

	operation GroverDiffusionOperator ( q0: Qubit , q1: Qubit ) : ()
	{
		body
		{
			H ( q0 );
			H ( q1 );

			H ( q1 );
			CNOT ( q0 , q1 );
			H ( q1 );

			X ( q0 );
			H ( q1 );
			CNOT ( q0 , q1 );
			H ( q1 );
			X ( q0 );

			X ( q1 );
			H ( q0 );
			CNOT ( q1 , q0 );
			H ( q0 );
			X ( q1 );

			H ( q0 );
			H ( q1 );
		}
	}

	operation GroverDiffusionOperatorTShirt ( q0: Qubit , q1: Qubit ) : ()
	{
		body
		{
			H ( q0 );
			H ( q1 );

			X ( q0 );
			H ( q0 );
			X ( q1 );
			CNOT ( q1 , q0 );
			X ( q1 );
			H ( q0 );
			X ( q0 );

			H ( q0 );
			H ( q1 );
		}
	}
}
