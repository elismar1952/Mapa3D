function POLY3=polyfit3d(T,XYZ,M,varargin)

    N=numel(T);
    if(N != size(XYZ,1))
        error('First and second parameter have different sizes!')
    endif

    if nargin>3
        W=varargin{1};
    else
        W=ones(size(T));
    endif

    if(N != size(W,1))
        error('First and 4th parameter have different sizes!')
    endif

    P=zeros(N*3,1);
    WW=zeros(N*3,N*3);
    A=zeros(N*3,(M+1)*3);

    aa=zeros(1,M+1);
    zeroaa=zeros(1,M+1);

    for n=1:N
        P((n-1)*3+1)=XYZ(n,1);
        P((n-1)*3+2)=XYZ(n,2);
        P((n-1)*3+3)=XYZ(n,3);

        WW((n-1)*3+1,(n-1)*3+1)=W(n);
        WW((n-1)*3+2,(n-1)*3+2)=W(n);
        WW((n-1)*3+3,(n-1)*3+3)=W(n);

        aa(end)=1;
        for II=1:M
            aa(end-II)=T(n)^(II);
        endfor
        A((n-1)*3+1,:)=[aa     zeroaa zeroaa];
        A((n-1)*3+2,:)=[zeroaa aa     zeroaa];
        A((n-1)*3+3,:)=[zeroaa zeroaa aa    ];
    endfor

    CC=inv(A'*WW*A)*A'*WW*P;

    POLY3=[ CC(1:(M+1))';
            CC((M+2):(2*M+2))';
            CC((2*M+3):(3*M+3))'];
endfunction


