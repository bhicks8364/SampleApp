{"filter":false,"title":"20150519164805_add_markup_to_orders.rb","tooltip":"/db/migrate/20150519164805_add_markup_to_orders.rb","undoManager":{"stack":[[{"start":{"row":5,"column":29},"end":{"row":5,"column":33},"action":"remove","lines":["type"],"id":31},{"start":{"row":5,"column":29},"end":{"row":5,"column":30},"action":"insert","lines":["m"]}],[{"start":{"row":5,"column":30},"end":{"row":5,"column":31},"action":"insert","lines":["i"],"id":32}],[{"start":{"row":5,"column":31},"end":{"row":5,"column":32},"action":"insert","lines":["n"],"id":33}],[{"start":{"row":5,"column":32},"end":{"row":5,"column":33},"action":"insert","lines":["_"],"id":34}],[{"start":{"row":5,"column":33},"end":{"row":5,"column":34},"action":"insert","lines":["p"],"id":35}],[{"start":{"row":5,"column":34},"end":{"row":5,"column":35},"action":"insert","lines":["a"],"id":36}],[{"start":{"row":5,"column":35},"end":{"row":5,"column":36},"action":"insert","lines":["y"],"id":37}],[{"start":{"row":5,"column":39},"end":{"row":5,"column":45},"action":"remove","lines":["string"],"id":38},{"start":{"row":5,"column":39},"end":{"row":5,"column":40},"action":"insert","lines":["d"]}],[{"start":{"row":5,"column":40},"end":{"row":5,"column":41},"action":"insert","lines":["e"],"id":39}],[{"start":{"row":5,"column":41},"end":{"row":5,"column":42},"action":"insert","lines":["c"],"id":40}],[{"start":{"row":5,"column":39},"end":{"row":5,"column":42},"action":"remove","lines":["dec"],"id":41},{"start":{"row":5,"column":39},"end":{"row":5,"column":46},"action":"insert","lines":["decimal"]}],[{"start":{"row":5,"column":46},"end":{"row":6,"column":0},"action":"insert","lines":["",""],"id":42},{"start":{"row":6,"column":0},"end":{"row":6,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":6,"column":4},"end":{"row":6,"column":46},"action":"insert","lines":["add_column :job_orders, :min_pay, :decimal"],"id":43}],[{"start":{"row":6,"column":30},"end":{"row":6,"column":32},"action":"remove","lines":["in"],"id":44},{"start":{"row":6,"column":30},"end":{"row":6,"column":31},"action":"insert","lines":["a"]}],[{"start":{"row":6,"column":31},"end":{"row":6,"column":32},"action":"insert","lines":["x"],"id":45}],[{"start":{"row":6,"column":46},"end":{"row":7,"column":0},"action":"insert","lines":["",""],"id":46},{"start":{"row":7,"column":0},"end":{"row":7,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":7,"column":4},"end":{"row":7,"column":46},"action":"insert","lines":["add_column :job_orders, :max_pay, :decimal"],"id":47}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":36},"action":"remove","lines":["pay"],"id":48},{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["b"]}],[{"start":{"row":7,"column":34},"end":{"row":7,"column":35},"action":"insert","lines":["i"],"id":49}],[{"start":{"row":7,"column":35},"end":{"row":7,"column":36},"action":"insert","lines":["l"],"id":50}],[{"start":{"row":7,"column":36},"end":{"row":7,"column":37},"action":"insert","lines":["l"],"id":51}],[{"start":{"row":7,"column":47},"end":{"row":8,"column":0},"action":"insert","lines":["",""],"id":52},{"start":{"row":8,"column":0},"end":{"row":8,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":8,"column":4},"end":{"row":8,"column":46},"action":"insert","lines":["add_column :job_orders, :max_pay, :decimal"],"id":53}],[{"start":{"row":8,"column":29},"end":{"row":8,"column":36},"action":"remove","lines":["max_pay"],"id":54},{"start":{"row":8,"column":29},"end":{"row":8,"column":30},"action":"insert","lines":["d"]}],[{"start":{"row":8,"column":30},"end":{"row":8,"column":31},"action":"insert","lines":["e"],"id":55}],[{"start":{"row":8,"column":31},"end":{"row":8,"column":32},"action":"insert","lines":["s"],"id":56}],[{"start":{"row":8,"column":32},"end":{"row":8,"column":33},"action":"insert","lines":["i"],"id":57}],[{"start":{"row":8,"column":33},"end":{"row":8,"column":34},"action":"insert","lines":["r"],"id":58}],[{"start":{"row":8,"column":34},"end":{"row":8,"column":35},"action":"insert","lines":["e"],"id":59}],[{"start":{"row":8,"column":35},"end":{"row":8,"column":36},"action":"insert","lines":["d"],"id":60}],[{"start":{"row":8,"column":36},"end":{"row":8,"column":37},"action":"insert","lines":["_"],"id":61}],[{"start":{"row":8,"column":37},"end":{"row":8,"column":38},"action":"insert","lines":["m"],"id":62}],[{"start":{"row":8,"column":38},"end":{"row":8,"column":39},"action":"insert","lines":["a"],"id":63}],[{"start":{"row":8,"column":39},"end":{"row":8,"column":40},"action":"insert","lines":["r"],"id":64}],[{"start":{"row":8,"column":40},"end":{"row":8,"column":41},"action":"insert","lines":["k"],"id":65}],[{"start":{"row":8,"column":41},"end":{"row":8,"column":42},"action":"insert","lines":["_"],"id":66}],[{"start":{"row":8,"column":42},"end":{"row":8,"column":43},"action":"insert","lines":["u"],"id":67}],[{"start":{"row":8,"column":43},"end":{"row":8,"column":44},"action":"insert","lines":["p"],"id":68}],[{"start":{"row":9,"column":0},"end":{"row":9,"column":43},"action":"remove","lines":["    add_index :job_orders, :acct_manager_id"],"id":69}],[{"start":{"row":3,"column":40},"end":{"row":3,"column":50},"action":"remove","lines":[", :decimal"],"id":70}],[{"start":{"row":2,"column":39},"end":{"row":2,"column":49},"action":"remove","lines":[", :decimal"],"id":71}],[{"start":{"row":8,"column":54},"end":{"row":9,"column":0},"action":"insert","lines":["",""],"id":72},{"start":{"row":9,"column":0},"end":{"row":9,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":9,"column":4},"end":{"row":9,"column":46},"action":"insert","lines":["add_column :job_orders, :max_pay, :decimal"],"id":73}],[{"start":{"row":9,"column":16},"end":{"row":9,"column":26},"action":"remove","lines":["job_orders"],"id":74},{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"insert","lines":["a"]}],[{"start":{"row":9,"column":17},"end":{"row":9,"column":18},"action":"insert","lines":["s"],"id":75}],[{"start":{"row":9,"column":18},"end":{"row":9,"column":19},"action":"insert","lines":["s"],"id":76}],[{"start":{"row":9,"column":19},"end":{"row":9,"column":20},"action":"insert","lines":["i"],"id":77}],[{"start":{"row":9,"column":20},"end":{"row":9,"column":21},"action":"insert","lines":["g"],"id":78}],[{"start":{"row":9,"column":21},"end":{"row":9,"column":22},"action":"insert","lines":["n"],"id":79}],[{"start":{"row":9,"column":22},"end":{"row":9,"column":23},"action":"insert","lines":["m"],"id":80}],[{"start":{"row":9,"column":16},"end":{"row":9,"column":23},"action":"remove","lines":["assignm"],"id":81},{"start":{"row":9,"column":16},"end":{"row":9,"column":27},"action":"insert","lines":["assignments"]}],[{"start":{"row":9,"column":30},"end":{"row":9,"column":37},"action":"remove","lines":["max_pay"],"id":82},{"start":{"row":9,"column":30},"end":{"row":9,"column":31},"action":"insert","lines":["r"]}],[{"start":{"row":9,"column":31},"end":{"row":9,"column":32},"action":"insert","lines":["e"],"id":83}],[{"start":{"row":9,"column":32},"end":{"row":9,"column":33},"action":"insert","lines":["c"],"id":84}],[{"start":{"row":9,"column":33},"end":{"row":9,"column":34},"action":"insert","lines":["r"],"id":85}],[{"start":{"row":9,"column":34},"end":{"row":9,"column":35},"action":"insert","lines":["u"],"id":86}],[{"start":{"row":9,"column":35},"end":{"row":9,"column":36},"action":"insert","lines":["i"],"id":87}],[{"start":{"row":9,"column":36},"end":{"row":9,"column":37},"action":"insert","lines":["t"],"id":88}],[{"start":{"row":9,"column":37},"end":{"row":9,"column":38},"action":"insert","lines":["e"],"id":89}],[{"start":{"row":9,"column":38},"end":{"row":9,"column":39},"action":"insert","lines":["r"],"id":90}],[{"start":{"row":9,"column":39},"end":{"row":9,"column":40},"action":"insert","lines":["_"],"id":91}],[{"start":{"row":9,"column":40},"end":{"row":9,"column":41},"action":"insert","lines":["i"],"id":92}],[{"start":{"row":9,"column":41},"end":{"row":9,"column":42},"action":"insert","lines":["d"],"id":93}],[{"start":{"row":9,"column":45},"end":{"row":9,"column":52},"action":"remove","lines":["decimal"],"id":94},{"start":{"row":9,"column":45},"end":{"row":9,"column":46},"action":"insert","lines":["i"]}],[{"start":{"row":9,"column":46},"end":{"row":9,"column":47},"action":"insert","lines":["n"],"id":95}],[{"start":{"row":9,"column":47},"end":{"row":9,"column":48},"action":"insert","lines":["t"],"id":96}],[{"start":{"row":9,"column":48},"end":{"row":9,"column":49},"action":"insert","lines":["e"],"id":97}],[{"start":{"row":9,"column":45},"end":{"row":9,"column":49},"action":"remove","lines":["inte"],"id":98},{"start":{"row":9,"column":45},"end":{"row":9,"column":52},"action":"insert","lines":["integer"]}],[{"start":{"row":9,"column":52},"end":{"row":10,"column":0},"action":"insert","lines":["",""],"id":99},{"start":{"row":10,"column":0},"end":{"row":10,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":10,"column":4},"end":{"row":10,"column":52},"action":"insert","lines":["add_column :assignments, :recruiter_id, :integer"],"id":100}],[{"start":{"row":10,"column":16},"end":{"row":10,"column":27},"action":"remove","lines":["assignments"],"id":101},{"start":{"row":10,"column":16},"end":{"row":10,"column":17},"action":"insert","lines":["t"]}],[{"start":{"row":10,"column":17},"end":{"row":10,"column":18},"action":"insert","lines":["i"],"id":102}],[{"start":{"row":10,"column":18},"end":{"row":10,"column":19},"action":"insert","lines":["m"],"id":103}],[{"start":{"row":10,"column":16},"end":{"row":10,"column":19},"action":"remove","lines":["tim"],"id":104},{"start":{"row":10,"column":16},"end":{"row":10,"column":26},"action":"insert","lines":["timesheets"]}],[{"start":{"row":10,"column":29},"end":{"row":10,"column":41},"action":"remove","lines":["recruiter_id"],"id":105},{"start":{"row":10,"column":29},"end":{"row":10,"column":30},"action":"insert","lines":["a"]}],[{"start":{"row":10,"column":30},"end":{"row":10,"column":31},"action":"insert","lines":["p"],"id":106}],[{"start":{"row":10,"column":31},"end":{"row":10,"column":32},"action":"insert","lines":["p"],"id":107}],[{"start":{"row":10,"column":32},"end":{"row":10,"column":33},"action":"insert","lines":["r"],"id":108}],[{"start":{"row":10,"column":33},"end":{"row":10,"column":34},"action":"insert","lines":["o"],"id":109}],[{"start":{"row":10,"column":29},"end":{"row":10,"column":34},"action":"remove","lines":["appro"],"id":110},{"start":{"row":10,"column":29},"end":{"row":10,"column":37},"action":"insert","lines":["approved"]}],[{"start":{"row":10,"column":37},"end":{"row":10,"column":38},"action":"insert","lines":["_"],"id":111}],[{"start":{"row":10,"column":38},"end":{"row":10,"column":39},"action":"insert","lines":["b"],"id":112}],[{"start":{"row":10,"column":39},"end":{"row":10,"column":40},"action":"insert","lines":["y"],"id":113}],[{"start":{"row":10,"column":50},"end":{"row":11,"column":0},"action":"insert","lines":["",""],"id":114},{"start":{"row":11,"column":0},"end":{"row":11,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":11,"column":4},"end":{"row":11,"column":52},"action":"insert","lines":["add_column :assignments, :recruiter_id, :integer"],"id":115}],[{"start":{"row":11,"column":16},"end":{"row":11,"column":27},"action":"remove","lines":["assignments"],"id":116},{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["t"]}],[{"start":{"row":11,"column":17},"end":{"row":11,"column":18},"action":"insert","lines":["i"],"id":117}],[{"start":{"row":11,"column":18},"end":{"row":11,"column":19},"action":"insert","lines":["m"],"id":118}],[{"start":{"row":11,"column":16},"end":{"row":11,"column":19},"action":"remove","lines":["tim"],"id":119},{"start":{"row":11,"column":16},"end":{"row":11,"column":26},"action":"insert","lines":["timesheets"]}],[{"start":{"row":11,"column":29},"end":{"row":11,"column":41},"action":"remove","lines":["recruiter_id"],"id":120},{"start":{"row":11,"column":29},"end":{"row":11,"column":30},"action":"insert","lines":["a"]}],[{"start":{"row":11,"column":30},"end":{"row":11,"column":31},"action":"insert","lines":["p"],"id":121}],[{"start":{"row":11,"column":31},"end":{"row":11,"column":32},"action":"insert","lines":["p"],"id":122}],[{"start":{"row":11,"column":32},"end":{"row":11,"column":33},"action":"insert","lines":["r"],"id":123}],[{"start":{"row":11,"column":29},"end":{"row":11,"column":33},"action":"remove","lines":["appr"],"id":124},{"start":{"row":11,"column":29},"end":{"row":11,"column":40},"action":"insert","lines":["approved_by"]}],[{"start":{"row":11,"column":39},"end":{"row":11,"column":40},"action":"remove","lines":["y"],"id":125}],[{"start":{"row":11,"column":38},"end":{"row":11,"column":39},"action":"remove","lines":["b"],"id":126}],[{"start":{"row":11,"column":38},"end":{"row":11,"column":39},"action":"insert","lines":["a"],"id":127}],[{"start":{"row":11,"column":39},"end":{"row":11,"column":40},"action":"insert","lines":["t"],"id":128}],[{"start":{"row":11,"column":43},"end":{"row":11,"column":50},"action":"remove","lines":["integer"],"id":129},{"start":{"row":11,"column":43},"end":{"row":11,"column":44},"action":"insert","lines":["d"]}],[{"start":{"row":11,"column":44},"end":{"row":11,"column":45},"action":"insert","lines":["a"],"id":130}],[{"start":{"row":11,"column":43},"end":{"row":11,"column":45},"action":"remove","lines":["da"],"id":131},{"start":{"row":11,"column":43},"end":{"row":11,"column":51},"action":"insert","lines":["datetime"]}]],"mark":100,"position":100},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":11,"column":51},"end":{"row":11,"column":51},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1432054375908,"hash":"e9b9514deed9202d87fa7c67d0ed2ffcdf5ca855"}