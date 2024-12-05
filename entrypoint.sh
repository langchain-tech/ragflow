
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
export PYTHONPATH=$(pwd)

PY=python3
if [[ -z "$WS" || $WS -lt 1 ]]; then
  WS=2
fi

function task_exe(){
    while [ 1 -eq 1 ];do
      $PY rag/svr/task_executor_v2.py $1;
    done
}

for ((i=0;i<WS;i++))
do
  task_exe  $i &
done

while [ 1 -eq 1 ];do
    $PY api/ragflow_server.py
done

wait;
